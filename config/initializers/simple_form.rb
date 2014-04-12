SimpleForm.setup do |config|
  config.wrappers :default, class: :input, error_class: 'field-with-errors' do |b|
    b.use :placeholder
    b.use :label
    b.optional :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :input
    b.use :error, wrap_with: { tag: :span, class: :error }

    config.error_notification_class = 'alert alert-error'
    config.error_notification_tag = :div
  end

  config.default_wrapper = :default
  config.boolean_style = :nested
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'alert alert-error'
  config.label_class = 'control-label'
  config.browser_validations = false
end