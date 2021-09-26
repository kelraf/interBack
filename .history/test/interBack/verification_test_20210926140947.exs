# defmodule InterBack.VerificationTest do
#   use InterBack.DataCase

#   alias InterBack.Verification

#   describe "verifies" do
#     alias InterBack.Verification.Verify

#     @valid_attrs %{code: 42, user_id: 42, verified: true}
#     @update_attrs %{code: 43, user_id: 43, verified: false}
#     @invalid_attrs %{code: nil, user_id: nil, verified: nil}

#     def verify_fixture(attrs \\ %{}) do
#       {:ok, verify} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Verification.create_verify()

#       verify
#     end

#     test "list_verifies/0 returns all verifies" do
#       verify = verify_fixture()
#       assert Verification.list_verifies() == [verify]
#     end

#     test "get_verify!/1 returns the verify with given id" do
#       verify = verify_fixture()
#       assert Verification.get_verify!(verify.id) == verify
#     end

#     test "create_verify/1 with valid data creates a verify" do
#       assert {:ok, %Verify{} = verify} = Verification.create_verify(@valid_attrs)
#       assert verify.code == 42
#       assert verify.user_id == 42
#       assert verify.verified == true
#     end

#     test "create_verify/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Verification.create_verify(@invalid_attrs)
#     end

#     test "update_verify/2 with valid data updates the verify" do
#       verify = verify_fixture()
#       assert {:ok, %Verify{} = verify} = Verification.update_verify(verify, @update_attrs)
#       assert verify.code == 43
#       assert verify.user_id == 43
#       assert verify.verified == false
#     end

#     test "update_verify/2 with invalid data returns error changeset" do
#       verify = verify_fixture()
#       assert {:error, %Ecto.Changeset{}} = Verification.update_verify(verify, @invalid_attrs)
#       assert verify == Verification.get_verify!(verify.id)
#     end

#     test "delete_verify/1 deletes the verify" do
#       verify = verify_fixture()
#       assert {:ok, %Verify{}} = Verification.delete_verify(verify)
#       assert_raise Ecto.NoResultsError, fn -> Verification.get_verify!(verify.id) end
#     end

#     test "change_verify/1 returns a verify changeset" do
#       verify = verify_fixture()
#       assert %Ecto.Changeset{} = Verification.change_verify(verify)
#     end
#   end
# end
