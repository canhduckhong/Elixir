defmodule RealDealApi.AccountsTest do
	use RealDealApi.Support.DataCase
	alias RealDealApi.{Accounts, Accounts.Account}

	setup do
		Ecto.Adapters.SQL.Sandbox.checkout(RealDealApi.Repo)
	end

	describe "create_account/1" do
		test "success: it inserts an account in the db and returns the account" do
			params = Factory.string_params_for(:account)
			dbg params

			assert {:ok, %Account{} = returned_account} = Accounts.create_account(params)
			account_from_db = Repo.get(Account, returned_account.id)
			dbg account_from_db
			assert returned_account == account_from_db

			mutated = ["hash_password"]

			for {param_field, expected} <- params, param_field not in mutated do
				schema_field = String.to_existing_atom(param_field)
				actual = Map.get(account_from_db, schema_field)

				assert actual == expected, "Value did not match for field: #{param_field}\nexpected: #{inspect(expected)}\nactual: #{inspect(actual)}"
			end
			assert Bcrypt.verify_pass(params["hash_password"], returned_account.hash_password),
				"Password: #{inspect(params["hash_password"])} does not match \nhash:#{inspect(returned_account)}"
		end
	end
end
