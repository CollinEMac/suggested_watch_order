defmodule SuggestedWatchOrderWeb.RelationshipControllerTest do
  use SuggestedWatchOrderWeb.ConnCase

  import SuggestedWatchOrder.MediaFixtures

  @create_attrs %{type: "some type"}
  @update_attrs %{type: "some updated type"}
  @invalid_attrs %{type: nil}

  describe "index" do
    test "lists all relationships", %{conn: conn} do
      conn = get(conn, Routes.relationship_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Relationships"
    end
  end

  describe "new relationship" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.relationship_path(conn, :new))
      assert html_response(conn, 200) =~ "New Relationship"
    end
  end

  describe "create relationship" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.relationship_path(conn, :create), relationship: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.relationship_path(conn, :show, id)

      conn = get(conn, Routes.relationship_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Relationship"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.relationship_path(conn, :create), relationship: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Relationship"
    end
  end

  describe "edit relationship" do
    setup [:create_relationship]

    test "renders form for editing chosen relationship", %{conn: conn, relationship: relationship} do
      conn = get(conn, Routes.relationship_path(conn, :edit, relationship))
      assert html_response(conn, 200) =~ "Edit Relationship"
    end
  end

  describe "update relationship" do
    setup [:create_relationship]

    test "redirects when data is valid", %{conn: conn, relationship: relationship} do
      conn = put(conn, Routes.relationship_path(conn, :update, relationship), relationship: @update_attrs)
      assert redirected_to(conn) == Routes.relationship_path(conn, :show, relationship)

      conn = get(conn, Routes.relationship_path(conn, :show, relationship))
      assert html_response(conn, 200) =~ "some updated type"
    end

    test "renders errors when data is invalid", %{conn: conn, relationship: relationship} do
      conn = put(conn, Routes.relationship_path(conn, :update, relationship), relationship: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Relationship"
    end
  end

  describe "delete relationship" do
    setup [:create_relationship]

    test "deletes chosen relationship", %{conn: conn, relationship: relationship} do
      conn = delete(conn, Routes.relationship_path(conn, :delete, relationship))
      assert redirected_to(conn) == Routes.relationship_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.relationship_path(conn, :show, relationship))
      end
    end
  end

  defp create_relationship(_) do
    relationship = relationship_fixture()
    %{relationship: relationship}
  end
end
