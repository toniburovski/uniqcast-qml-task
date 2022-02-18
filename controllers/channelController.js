.import "../utils/networkManager.js" as NetworkManager
.import "../utils/constants.js" as Constants

function getChannels() {
    const obj = {
        method: "GET",
        url: Constants.constants.API_URL + Constants.constants.CHANNELS_ENDPOINT,
    }

    return NetworkManager.networkManager.request(obj);
}

function getChannel(id) {
    const obj = {
        method: "GET",
        url: Constants.constants.API_URL + Constants.constants.CHANNELS_ENDPOINT + "/" + id,
    }

    return NetworkManager.networkManager.request(obj);
}
