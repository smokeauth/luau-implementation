getgenv().license_key = "YOUR_LICENSE_KEY_HERE" --  i would make a ui and ask for the key


-- obfuscate this part or the whole script if u have a keysystem ui upto you.
getgenv().application_identifier = "YOUR_APP_ID_HERE" -- your app id from our site
local http_service = game:GetService("HttpService")
local body = "license_key=" .. getgenv().license_key .. "&app_id=" .. getgenv().application_identifier
local response
local success, err = pcall(function()
	response = HttpService:RequestAsync({
		Url = "https://smokeauth.org/luau/",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/x-www-form-urlencoded"
		},
		Body = body
	})
end)
if success and response then
	if response.StatusCode == 200 then
		print("Loaded")
    -- do whatever your product is supposed to do when they have a valid key
	else
		print("Invalid Key")
	end
else
	print("Invalid Key")
end
