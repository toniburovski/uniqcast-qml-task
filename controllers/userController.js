.import "../utils/networkManager.js" as NetworkManager
.import "../utils/constants.js" as Constants

function login(loginData) {
    const obj = {
        method: "POST",
        url: Constants.constants.API_URL + Constants.constants.AUTH_ENDPOINT,
        body: loginData
    }

    const response = NetworkManager.networkManager.request(obj);
    NetworkManager.networkManager.setJwt(response.jwt);
    return response;
}

