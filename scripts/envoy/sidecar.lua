local sidecar_cluster = "outbound|8080||ingress-sidecar.ingress-sidecar"

function on_healthz_call(cluster, request_handle)
    local req_headers = {
        [":authority"] = "sidecar",
        [":method"] = "GET",
        [":path"] = "/healthz/ready",
    }

    local resp_headers
    local _, err = pcall(
    function ()
        resp_headers, _ = request_handle:httpCall(cluster, req_headers, "", 1000)
    end)

    if err then
        request_handle:respond({ [":status"] = "503" }, "")
    end

    request_handle:respond({ [":status"] = resp_headers[":status"] }, "")
end

function envoy_on_request(request_handle)
    on_healthz_call(sidecar_cluster, request_handle)
end
