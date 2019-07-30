Deface::Override.new(virtual_path: 'spree/layouts/admin',
  name: 'add_admin_advertisment_index_menu',
  insert_bottom: "[data-hook='admin_tabs']",
  partial: 'spree/admin/advertisments/menu_options_advertisment'
)
