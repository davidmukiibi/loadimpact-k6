import { check, sleep } from "k6";
import http from "k6/http";

// Options
export let options = {
    stages: [
        { duration: "60s", target: 10 },
        { duration: "60s", target: 0 }
    ],

    thresholds: {
        http_req_duration: ["p(95)<500"]
    },

    ext: {
        loadimpact: {
            name: "k6 cloud test!",
            distribution: {
                scenarioLabel1: { loadZone: "amazon:us:ashburn", percent: 100 }
            }
        }
    }
};

// Scenario
export default function() {
        let res = http.get("https://test.loadimpact.com/");
        check(res, {
            "is status 200": (r) => r.status === 200
        });
        sleep(10);
    ;
}