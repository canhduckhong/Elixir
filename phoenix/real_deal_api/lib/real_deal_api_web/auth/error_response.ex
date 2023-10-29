defmodule RealDealApiWeb.Auth.ErrorResponse.Unauthorized do
	defexception [message: "Unathorized", plug_status: 401]
end
