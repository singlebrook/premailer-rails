require 'spec_helper'

describe PremailerRails::CSSLoaders::AssetPipelineLoader do
  context "#load" do
    before do
      Rails.configuration.stubs(:serve_static_assets).returns(false)
      Rails.configuration.stubs(:assets).returns(
        stub(
          :enabled => true,
          :compile => true,
          :prefix  => '/assets',
          :digests => {
            'base.css' => 'base-089e35bd5d84297b8d31ad552e433275.css'
          }
        )
      )
      Rails.application.assets.stubs(:find_asset).returns("")
    end

    it "returns the contents of the blank default asset" do
      Kernel.stubs(:open).returns(StringIO.new(''))

      PremailerRails::CSSLoaders::AssetPipelineLoader.load(:default).should == ""
    end
  end
end
