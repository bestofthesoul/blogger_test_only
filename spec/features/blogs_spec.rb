require "rails_helper"

RSpec.feature "Blogs", type: :feature do

  scenario "User can add blog" do
    sign_in
    visit blogs_path

    click_link "Create a blog"
    fill_in "blog_title", with: "Day 1"
    fill_in "blog_content", with: "Bla Bla Bla"

    expect { click_button "Submit" }.to change { Blog.count }.by(1)
  end

  scenario "User can view blogs" do
    blog = create(:blog)
    sign_in(blog.user)

    visit blogs_path

    expect(page).to have_text(blog.title)
    expect(page).to have_text(blog.content)
  end

  scenario "Guest cannot see blogs page" do
    visit blogs_path

    expect(current_path).to eq(new_session_path)
  end

end
