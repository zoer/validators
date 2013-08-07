class NotEmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || I18n.translate("validation.should_not_include_email"))
    end
  end

  def self.kind
    :custom
  end
end