require "test_helper"

class WikiTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wiki_tag = wiki_tags(:one)
  end

  test "should get index" do
    get wiki_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_wiki_tag_url
    assert_response :success
  end

  test "should create wiki_tag" do
    assert_difference("WikiTag.count") do
      post wiki_tags_url, params: { wiki_tag: { tag_id: @wiki_tag.tag_id, wiki_id: @wiki_tag.wiki_id } }
    end

    assert_redirected_to wiki_tag_url(WikiTag.last)
  end

  test "should show wiki_tag" do
    get wiki_tag_url(@wiki_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_wiki_tag_url(@wiki_tag)
    assert_response :success
  end

  test "should update wiki_tag" do
    patch wiki_tag_url(@wiki_tag), params: { wiki_tag: { tag_id: @wiki_tag.tag_id, wiki_id: @wiki_tag.wiki_id } }
    assert_redirected_to wiki_tag_url(@wiki_tag)
  end

  test "should destroy wiki_tag" do
    assert_difference("WikiTag.count", -1) do
      delete wiki_tag_url(@wiki_tag)
    end

    assert_redirected_to wiki_tags_url
  end
end
