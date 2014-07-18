require 'rails_helper'

feature "Topics", :type => :feature do
  subject { page }
  describe "topics index" do
    before do
      10.times { FactoryGirl.create(:topic ) }
    end
    context "anonymous user" do
      before { visit root_path }
      it "shoud list the topics" do
        Topic.all.each do |topic|          
          should have_link(topic.title, href: topic_path(topic))
        end
      end
    end
  end
end
