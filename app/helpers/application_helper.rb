module ApplicationHelper
    def asset_exists?(asset_path)
      if Rails.application.assets_manifest.assets[asset_path].present?
        true
      else
        false
      end
    end
  end
  