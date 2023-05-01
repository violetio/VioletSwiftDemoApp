## How to regenerate the SwiftSDK Code

In Terminal,

  - cd to `OpenAPI/SwiftSDK`
  - run
`openapi-generator generate -g swift5  -i ./violet_public_api.yaml --additional-properties=projectName=VioletPublicClientAPI,useSPMFileStructure=true`