module ApplicationHelper
  def localize_currency(currency)
    if I18n.locale == :es
      currency * 0.9.to_d
    else
      currency
    end
  end
end
