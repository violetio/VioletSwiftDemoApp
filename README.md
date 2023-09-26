# Violet Swift Demo App
This is a demo app built for iOS that powers full-checkout powered by Violet

## Important

This is a demo app that shows how to use Violet's Checkout API. It should not be deployed to production without adding user authentication to prevent malicious use.

## Getting Started

1. Sign up at https://channel.violet.io/signup and create an app to get your app ID and app secret.

2. Login with the instructions [here](https://docs.violet.io/guides/quickstart/postman-login) to retrieve your refresh token

More information about the demo app [here](https://docs.violet.io/guides/violet-sample-app)


## Violet Proxy Server

The iOS API Calls are supported via Proxy Server available here:
https://github.com/violetio/violet-proxy-server

### Starting the Proxy Server

1. Navigate to the source directory of the package you cloned. 
2. Install all dependencies
    
    ```bash 
    npm install
    ```
    
3. Create a `.env` file in the root directory of the git repository (this will be something like `~/path_to_git_repo`) and paste the following with your information
    
    ```bash
    APP_SECRET=[REDACTED]
    APP_ID=[REDACTED]
    API_ENDPOINT=[VIOLET_API_ENDPOINT. Ex: https://sandbox-api.violet.io]
    REFRESH_TOKEN=[VIOLET REFRESH TOKEN AFTER LOGIN]
    ```
    
4. Run the Proxy server from the root directory of the git repository (this will be something like `~/path_to_git_repo`) through the following command:
    
    ```bash
    npm run start
    ```
    
5. Your proxy server is now running on http://localhost:8020

### Making calls to the Violet API

To make authenticated calls to the Violet API, all you need to do is call the proxy server with `/api/<violet_endpoint>` from your client. For example, to call our GET Merchants API: 

```json
curl --location --request GET 'http://localhost:8020/api/merchants'
```

 For a full list of the Violet APIs, please refer to our API reference.

 ### Launch the iOS Demo App. 
 
 The Violet Swift REST [SDK](https://github.com/violetio/violet-swift) manages calls to the Proxy for the iOS Demo App 