class BookSettingsController < ApplicationController
    before_action :find_or_create_setting, only: [:show]

    def_param_group :book_setting do
      param :may_download, :boolean, desc: "book_settings_can_download_loc", :required => false
      param :may_copied, String, desc: 'book_settings_can_copied_loc', :required => false
      param :payment_all_book, :number, desc: 'book_settings_all_payment_loc', :required => false
      param :payment, :number, desc: 'book_settings_payment_loc', :required => false
      param :status, :number, desc: 'book_settings_status_loc'
    end

    api :GET, '/book_setting/:id/'
    param :id, :number, desc: 'book_setting_id_loc', :required => true
    param_group :errors, ApplicationController
    def show
      if find_or_create_setting
        render json: find_or_create_setting
      else
        bad_request!(messages: ['Something went wrong!', find_or_create_setting.errors])
      end
    end

    api :PATCH, '/books/'
    param_group :book_setting
    param_group :errors, ApplicationController
    def update
      if update_setting
        render json: update_setting.reload!
      else
        bad_request! find_book: update_setting.errors
      end
    end
  
    private
  
    def attrs
      {
        may_download: params.fetch(:may_download, false).to_bool,
        may_copied: params.fetch(:may_copied, false).to_bool,
        payment_all_book: params.fetch(:payment_all_book, false).to_bool,
        payment: params.fetch(:payment, false).to_bool,
        status: params.fetch(:status, 'in_progress').to_bool
      }
    end

    def update_setting
      @update_setting ||= find_or_create_setting.update(attrs)
    end
  
    def find_or_create_setting
      @find_or_create_setting ||= BookSetting.find_or_create_by(book_id: params[:book_id])
    end

end
