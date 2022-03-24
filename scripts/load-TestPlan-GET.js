import http from 'k6/http'
import { check, sleep } from 'k6'

const BASE_URL = 'http://app-test.producer.melifrontends.com';
const FURY_TOKEN = ''

export const options = {
    stages: [
        // ramp-up from 1 to 5 VUs in 5s
        { duration: '5s', target: 5 },

        // stay at rest on 5 VUs for 30s
        { duration: '30s', target: 5 },

        // ramp-down from 5 to 0 VUs in 5s
        { duration: '5s', target: 0 }
    ],
    thresholds: {
        // throws error if more than 90% of the requests takes more than 2 seconds to be completed
        http_req_duration: [
            {
                threshold: 'p(90) < 15000',
                abortOnFail: true,
                delayAbortEval: 100
            }
        ]
    }
}

export default function() {
    const params = {
        headers: {
          'x-auth-token': `${FURY_TOKEN}`,
        },
      };
    const response = http.get(`${BASE_URL}/get_key`, params)
    check(response, { "status is 200": (r) => r.status === 200 })
    sleep(.300)
}