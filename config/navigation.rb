# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :my_meds, 'My Meds', users_meds_path
    primary.item :my_scans, 'My Scans', scans_path
    primary.item :my_chart, 'My Chart', ''
    primary.item :my_network, 'My Network', ''
    primary.item :faqs, 'FAQs', faq_path
    primary.item :faqs, 'My Account', edit_user_registration_path
    primary.item :admin, 'Admin', admin_root_path, :if => Proc.new { current_user.is_admin? }
  end
end
