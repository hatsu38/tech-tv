module DatetimeFormat
  extend ActiveSupport::Concern

  included do
    def created_at_month
      self.created_at&.strftime("%Y年%m月")
    end

    def updated_at_month
      self.updated_at&.strftime("%Y年%m月")
    end

    def created_at_date
      self.created_at&.strftime("%Y年%m月%d日")
    end

    def updated_at_date
      self.updated_at&.strftime("%Y年%m月%d日")
    end

    def created_at_datetime
      self.created_at&.strftime("%Y/%m/%d %H:%M")
    end

    def updated_at_datetime
      self.updated_at&.strftime("%Y/%m/%d %H:%M")
    end

    def format_datetime(datetime)
      datetime&.strftime("%Y/%m/%d %H:%M")
    end
  end
end
