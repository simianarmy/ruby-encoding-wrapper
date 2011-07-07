require File.join(File.dirname(__FILE__), 'spec_helper')

describe EncodingWrapper::Queue do
  let(:video_source) { 'http://media.railscasts.com/assets/episodes/videos/272-markdown-with-redcarpet.mp4' }
  let(:instance) { EncodingWrapper::Queue.new(6663, '9cae7f2202ad0ace51c8e4cde70dd733') }

  def add_media
    instance.add_media video_source do |f|
      f.output 'flv'
    end
  end
  
  describe "encoding" do
    before(:each) do
      @res = add_media
      @media_id = @res[:media_id]
    end
    
    after(:each) do
      @cancel_res = instance.cancel_media(@media_id)
    end
    
    describe "add_media" do
      it "should return encoding media id in response hash" do
        @res.should be_a Hash
        @media_id.to_i.should > 0
      end
    end
  
    describe "request_status" do
      it "should return the encoding status for a media id" do
        res = instance.request_status @media_id
        res[:status].should_not be_nil
        res[:progress].should_not be_nil
      end
    end
  
    describe "cancel_media" do
      it "should return a status hash" do
        res = instance.cancel_media(@media_id)
        res[:status].should_not be_nil
      end
    end
  end
end