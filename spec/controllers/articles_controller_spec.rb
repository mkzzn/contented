require 'spec_helper'

describe ArticlesController do
  before(:each) do
    @attributes = {"title" => "excellent", "body" => "nonsense"}
  end

  describe "GET 'index'" do
    before(:each) do
      @ability = mock(Ability)
      Ability.stub! :new => @ability
    end

    context "user can view rough drafts" do
      it "should return all available articles" do
        @ability.stub! :can_view_rough_drafts => true
        Article.should_receive(:order).with("created_at desc")
      end
    end

    context "user cannot view rough drafts" do
      it "should return only published articles" do
        @ability.stub! :can_view_rough_drafts => false
        published_scope = mock("Published Scope")
        Article.should_receive(:published) { published_scope }
        published_scope.should_receive(:order).with("created_at desc")
      end
    end

    after(:each) do
      get 'index'
    end
  end

  describe "GET 'uncategorized'" do
    before(:each) do
      @article1 = mock_article :category_id => 1
      @article2 = mock_article :category_id => nil
    end

    it "should return only uncategorized articles" do
      Article.should_receive(:uncategorized) { [ @article2 ] }
      get 'uncategorized'
    end
  end

  describe "GET 'feed'" do
    it "should fetch the ten most recent articles" do
      published_scope = mock("Published Scope")
      order_scope = mock("Order Scope")
      Article.should_receive(:published) { published_scope }
      published_scope.should_receive(:order).with("created_at desc") { order_scope }
      order_scope.should_receive(:limit).with(10) { mock_article @attributes }
      get 'feed'
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @article = mock_article
      Article.stub!(:find) { @article }
      stub_current_ability
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :destroy, Article
      end

      it "should find the article" do
        Article.should_receive(:find).with(2) { @article }
        delete 'destroy', :id => 2
      end

      it "should destroy an article" do
        @article.should_receive(:destroy)
        delete 'destroy', :id => 2
      end

      it "should redirect to the articles index" do
        delete 'destroy', :id => 2
        response.code.should == "302"
        response.should redirect_to(articles_path)
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :destroy, Article
        delete 'destroy', :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash warning" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @article = mock_article(:id => 2)
      stub_current_ability
      Article.stub!(:find) { @article }
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :view, Article
      end

      it "should find the article" do
        Article.should_receive(:find).with(2) { @article }
      end

      it "should build a new comment" do
        @new_comment = mock_comment :save => false
        Comment.should_receive(:new).with({:article_id => 2}) { @new_comment }
      end

      it "should fetch article comments" do
        @comments = [ mock_comment(:article_id => 2) ]
        @article.should_receive(:comments) { @comments } 
      end

      after(:each) do
        get 'show', :id => 2
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :view, Article
        get 'show', :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash warning" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  describe "GET 'new'" do
    before(:each) do
      stub_current_ability
      @article = mock_article
      Article.stub!(:new) { @article }
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :build, Article
      end

      it "should build a new article" do
        Article.should_receive(:new)
        get 'new'
      end

      it "should build five attachments" do
        Article.stub!(:new) { mock_article }
        5.times do
          mock_attachments = mock("Attachments")
          mock_article.should_receive(:attachments) { mock_attachments }
          mock_attachments.should_receive(:build)
        end
        get 'new'
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :build, Article
        get "new"
      end

      it "should not build a new article" do
        Article.should_not_receive(:new)
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @article = mock_article
      Article.stub!(:find) { @article }
      stub_current_ability
    end

    it "should fetch the article" do
      Article.should_receive(:find).with(2) { @article }
      get :edit, :id => 2
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :edit, Article
      end

      it "should render the edit template" do
        get :edit, :id => 2
        response.should render_template("articles/edit")
      end

      it "should build five attachments" do
        Article.stub!(:new) { mock_article }
        5.times do
          mock_attachments = mock("Attachments")
          mock_article.should_receive(:attachments) { mock_attachments }
          mock_attachments.should_receive(:build)
        end
        get 'edit', :id => 2
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :edit, Article
        get :edit, :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @article = mock_article
      @attrs = { "weasel" => "pox", "hen" => "scatter" }
      Article.stub!(:find) { @article }
      stub_current_ability
    end

    it "should fetch the article" do
      Article.should_receive(:find).with(2) { @article }
      put 'update', :id => 2
    end

    context "user is authorized" do
      before(:each) do
        @ability.cannot :update, Article
        put 'update', :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.can :update, Article
      end

      it "should update the article with the given attributes" do
        @article.should_receive(:update_attributes).with(@attrs)
        put 'update', :id => 2, :article => @attrs
      end

      context "article is valid after update" do
        it "should redirect to show article page" do
          @article.stub!(:valid?) { true }
          put 'update', :id => 2, :article => @attrs      
          response.should redirect_to(article_path(@article))
        end
      end

      context "article is invalid after update" do
        it "should render the new article template" do
          @article.stub!(:valid?) { false }
          put 'update', :id => 2, :article => @attrs      
          response.should render_template("new")
        end
      end
    end
  end

  describe "POST 'create'" do
    before(:each) do
      stub_current_ability
    end

    context "user is authorized" do
      before(:each) do
        @article = mock_article
        @current_user = stub_model(User)
        controller.stub! :current_user => @current_user
        Article.stub!(:create) { @article }
        @ability.can :create, Article
      end

      it "should create a new article with user id" do
        @attributes.merge!("user_id" => @current_user[:id])
        Article.should_receive(:create).with(@attributes) { @article }
        post :create, :article => @attributes
      end

      context "article is valid after creation" do
        before(:each) do
          @article.stub!(:valid?) { true }
        end

        it "should set a flash notice" do
          @article.stub!(:title) { "Bee Article" }
          post :create, :article => @attributes
          request.flash[:notice].should == "Bee Article was successfully created"
        end

        it "should redirect to the articles path" do
          post :create, :article => @attributes
          response.code.should == "302"
          response.should redirect_to(articles_path)
        end
      end

      context "article is invalid after creation" do
        before(:each) do
          @article.stub!(:valid?) { false }
          post :create, :article => @attributes
        end

        it "should set a flash warning" do
          request.flash[:warning].should == "Article creation failed"
        end

        it "should render the new template" do
          response.should render_template("articles/new")
        end
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :create, Article
      end

      it "should not_create a new article" do
        Article.should_not_receive(:create).with(@attributes) { @article }
        post :create
      end

      it "should redirect to the homepage" do
        post :create
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        post :create
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  def mock_article(stubs={})
    (@mock_article ||= mock_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def mock_comment(stubs={})
    (@mock_comment ||= mock_model(Comment).as_null_object).tap do |comment|
      comment.stub(stubs) unless stubs.empty?
    end
  end

  def stub_current_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub!(:current_ability) { @ability }
  end
end
