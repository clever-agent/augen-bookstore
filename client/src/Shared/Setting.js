export default class Setting {
    static resolveAPIURL(path) {
    		let rootUrl = process.env.NODE_ENV === "development" ? 
    		"http://localhost:3001" : "http://augen-api-demo.com";

        return rootUrl + path;
    }
}
