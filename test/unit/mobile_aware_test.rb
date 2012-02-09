require "test_helper"

module BcmsMobile
  class MobileAwareTest < ActiveSupport::TestCase

    include MobileAware

    def setup

    end

    def teardown
    end

    test "Configuring a mobile cache directory" do
      expected_dir = File.join(Rails.root, 'cache')
      Rails.application.config.expects(:bcms_mobile_cache_directory).returns(expected_dir)

      assert_equal expected_dir, mobile_cache_directory
    end

    test "Configuring a cache directory" do
      expected_dir = File.join(Rails.root, 'cache')
      Rails.application.config.expects(:browsercms_cache_directory).returns(expected_dir)

      assert_equal expected_dir, cms_cache_directory
    end

    test "Use default cache directory" do
      default_cache_dir = File.join(Rails.root, 'public', 'cache')
      Rails.application.config.expects(:browsercms_cache_directory).returns(nil)

      assert_equal default_cache_dir, cms_cache_directory
    end

    test "Use default mobile cache directory" do
      default_cache_dir = File.join(Rails.root, 'public', 'mobile_cache')
      Rails.application.config.expects(:bcms_mobile_cache_directory).returns(nil)

      assert_equal default_cache_dir, mobile_cache_directory
    end
  end
end