require "rails_helper"

describe HelloController do

  describe "index" do
    setup do
      get :world
    end

    describe "assertions" do
      it "should give us HTML" do
        get :world, format: :html
        assert_respond_with(@controller, :success)
        # @controller.should respond_with_content_type(:html)
        # assert_respond_with_content_type(@controller, :html)
      end

      it "should not give us XML" do
        get :world, format: :xml
        assert_respond_with(@controller, :forbidden)
        # refute_respond_with_content_type(@controller, :xml)
      end
    end

    describe "with matchers" do
      it "should give us HTML" do
        must respond_with(:success)
      end
      
      it "should eventually give us JSON" do
        skip "should_eventually give us JSON"
      end


      # should_eventually "give us JSON" do
      #   @controller.must respond_with_content_type(:json)
      # end

      it "should not give us XML" do
        get :world, format: :xml
        wont respond_with(:success)
      end
    end

    describe "with subject" do
      subject { @controller }
      
      describe "Html request" do
        it { must respond_with(:success) }
        it { wont respond_with(:forbidden) }
      end
      
      describe "Forbidden XML request" do
        before :each do
          get :world, format: :xml
        end
        it { must respond_with(:forbidden) }
        it { wont respond_with(:success) }
      end


    end
  end

  # describe "have_content" do
  #   it "has page with content" do
  #     visit root_path
  #     assert_have_content page, "Hello World"
  #     refute_have_content page, "Goobye All!"
  #     page.must_have_content    "Hello World"
  #     page.wont_have_content    "Goobye All!"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_content("Hello World") }
  #     it { wont have_content("Goobye All!") }
  #     must { have_content("Hello World") }
  #     wont { have_content("Goobye All!") }
  #   end
  # end

  # describe "have_selector" do
  #   it "has page with heading" do
  #     visit root_path
  #     assert_have_selector page, "h1"
  #     refute_have_selector page, "h3"
  #     page.must_have_selector    "h1"
  #     page.wont_have_selector    "h3"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_selector("h1") }
  #     it { wont have_selector("h3") }
  #     must { have_selector("h1") }
  #     wont { have_selector("h3") }
  #   end
  # end

  # describe "have_link" do
  #   it "has a link to home" do
  #     visit root_path
  #     assert_have_link page, "home"
  #     refute_have_link page, "away"
  #     page.must_have_link    "home"
  #     page.wont_have_link    "away"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_link("home") }
  #     it { wont have_link("away") }
  #     must { have_link("home") }
  #     wont { have_link("away") }
  #   end
  # end

  # describe "have_field" do
  #   it "has a button to submit" do
  #     visit root_path
  #     assert_have_field page, "Email Address"
  #     refute_have_field page, "Bank Account"
  #     page.must_have_field    "Email Address"
  #     page.wont_have_field    "Bank Account"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_field("Email Address") }
  #     it { wont have_field("Bank Account") }
  #     must { have_field("Email Address") }
  #     wont { have_field("Bank Account") }
  #   end
  # end

  # describe "have_button" do
  #   it "has a button to login" do
  #     visit root_path
  #     assert_have_button page, "random button"
  #     refute_have_button page, "missing button"
  #     page.must_have_button    "random button"
  #     page.wont_have_button    "missing button"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_button("random button") }
  #     it { wont have_button("missing button") }
  #     must { have_button("random button") }
  #     wont { have_button("missing button") }
  #   end
  # end

  # describe "have_checked_field" do
  #   it "has a button to submit" do
  #     visit root_path
  #     assert_have_checked_field page, "going"
  #     refute_have_checked_field page, "avoid"
  #     page.must_have_checked_field    "going"
  #     page.wont_have_checked_field    "avoid"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_checked_field("going") }
  #     it { wont have_checked_field("avoid") }
  #     must { have_checked_field("going") }
  #     wont { have_checked_field("avoid") }
  #   end
  # end

  # describe "have_unchecked_field" do
  #   it "has a button to submit" do
  #     visit root_path
  #     assert_have_unchecked_field page, "avoid"
  #     refute_have_unchecked_field page, "going"
  #     page.must_have_unchecked_field    "avoid"
  #     page.wont_have_unchecked_field    "going"
  #   end

  #   describe "with subject" do
  #     before  { visit(root_path) }
  #     subject { page }

  #     it { must have_unchecked_field("avoid") }
  #     it { wont have_unchecked_field("going") }
  #     must { have_unchecked_field("avoid") }
  #     wont { have_unchecked_field("going") }
  #   end
  # end

end
