# HTTP Status Code Summary

We use conventional HTTP response codes to indicate success or failure of an
API request. In general, codes in the 2xx range indicate success, codes in the
4xx range indicate an error that resulted from the provided information (e.g. a
required parameter was missing, a charge failed, etc.), and codes in the 5xx
range indicate an error with our servers.


    | Code                               | Description                               |
    |------------------------------------|-------------------------------------------|
    | 200 - OK                           | Everything worked as expected.            |
    | 201 - Created                      | New resource being created                |
    | 400 - Bad Request                  | Often missing a required parameter.       |
    | 401 - Unauthorized                 | No valid API key provided.                |
    | 402 - Request Failed               | Parameters were valid but request failed. |
    | 404 - Not Found                    | The requested item doesn't exist.         |
    | 500, 502, 503, 504 - Server Errors | Something went wrong on our end.  |

# Errors

    | ATTRIBUTES         | Description                                                                 |
    |--------------------|-----------------------------------------------------------------------------|
    | code               | The same as HTTP status code. This can help other clients are easy to read. |
    | details (optional) | List of validation errors. ex: {name: [{error: :blank}]}                    |
    | message (optional) | A human-readable message giving more details about the error.               |
