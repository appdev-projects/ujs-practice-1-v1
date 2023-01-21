require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Owner", with: @task.owner_id
    fill_in "Task caption", with: @task.task_caption
    fill_in "Tasks", with: @task.tasks
    fill_in "Tasks count", with: @task.tasks_count
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Owner", with: @task.owner_id
    fill_in "Task caption", with: @task.task_caption
    fill_in "Tasks", with: @task.tasks
    fill_in "Tasks count", with: @task.tasks_count
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end
