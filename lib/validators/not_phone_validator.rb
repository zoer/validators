class NotPhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /[\d\-_\s\(\)]{6,}/
      if value.gsub(/[^\d]/, "").length > 5
        record.errors[attribute] << (options[:message] || I18n.translate("validation.should_not_include_phone"))
      end
    end
  end
end