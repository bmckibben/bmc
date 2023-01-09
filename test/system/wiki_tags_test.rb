require "application_system_test_case"

class WikiTagsTest < ApplicationSystemTestCase
  setup do
    @wiki_tag = wiki_tags(:one)
  end

  test "visiting the index" do
    visit wiki_tags_url
    assert_selector "h1", text: "Wiki tags"
  end

  test "should create wiki tag" do
    visit wiki_tags_url
    click_on "New wiki tag"

    fill_in "Tag", with: @wiki_tag.tag_id
    fill_in "Wiki", with: @wiki_tag.wiki_id
    click_on "Create Wiki tag"

    assert_text "Wiki tag was successfully created"
    click_on "Back"
  end

  test "should update Wiki tag" do
    visit wiki_tag_url(@wiki_tag)
    click_on "Edit this wiki tag", match: :first

    fill_in "Tag", with: @wiki_tag.tag_id
    fill_in "Wiki", with: @wiki_tag.wiki_id
    click_on "Update Wiki tag"

    assert_text "Wiki tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Wiki tag" do
    visit wiki_tag_url(@wiki_tag)
    click_on "Destroy this wiki tag", match: :first

    assert_text "Wiki tag was successfully destroyed"
  end
end
