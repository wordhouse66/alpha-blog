require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    test 'get new category form and create new category' do
        get new_category_path
        #assert_template 'categories/new'
        assert_difference("Category.count", 1) do
            post categories_url, params: { category: {name: "sports" } }
        end
    
        assert_redirected_to categories_url
        assert_match "sports", response.body
    end

end