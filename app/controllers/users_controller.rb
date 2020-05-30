# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_users, only: [:index]
  before_action :response_headers, only: [:index]
  before_action :find_user, only: [:show]
  before_action :check_range
  before_action :check_pagination

  def index
    render json: @find_users
  end

  def show
    if find_user
      render json: find_user
    else
      bad_request!(message: 'User not found')
    end
  end

  def create
    if create_user.save
      render json: create_user
    else
      bad_request!(create_user.errors.full_messages)
    end
  end

  def update
    if current_user.update(user_update_params)
      render json: current_user
    else
      bad_request! current_user: current_user.errors
    end
  end

  private

  def user_update_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :location
    )
  end

  def attrs
    {
      name: params[:name],
      password: params[:password],
      location: params[:location],
      range: params[:range],
      group_id: params[:group_id],
      email: params[:email],
    }
  end

  def range
    @range ||= Ranges.new(range_attrs: attrs[:range] || {})
  end

  def check_range
    bad_request!(range.errors.full_messages) if range.invalid?
  end

  def find_user
    @find_user ||= User.where(id: params[:id]).first
  end

  def create_user
    @create_user ||= User.new(attrs.except(:range, :group_id))
  end

  def check_pagination
    bad_request!(pagination.errors.full_messages) if pagination.invalid?
  end

  def pagination
    @pagination ||= Pagination.new(current_page: params.fetch(:page, 1), current_page_size: params.fetch(:page_size, 15))
  end

  def find_users
    return @scope if @scope

    @scope = User
    @scope = @scope.where(created_at: range) if range.present?
    @scope = @scope.where(group_id: attrs[:group_id]) if attrs[:group_id].present?
    @scope = @scope.where(email: attrs[:email]) if attrs[:email].present?
    @scope = @scope.where(name: attrs[:name]) if attrs[:name].present?
    @scope = @scope.paginate(page: page, per_page: per_page)
  end

  def users_count
    @find_users.count
  end

  def total_page_count
    users_count / pagination.page_size
  end

  def response_headers
    response.headers['X-Total-Pages-Count'] = total_page_count.to_s
    response.headers['X-Page-Index'] = pagination.page.to_s
    response.headers['X-Per-Page'] = pagination.page_size.to_s
    response.headers['X-Total-Count'] = users_count.to_s
  end
end
