//cqc-server.mjs: wrapper file around mail-enpoint

// This file requires CQC_SERVEROOT to be ../ since this 
// file (cqc-server.mjs) is in ../cqc-server dir which is 
// parallel to ./mail-endpoint.

import parseq from "../mail-endpoint/dependencies/parseq";
import {makeServer} from "../mail-endpoint/server"

// makeServer return a parseq Requstor which is a function
// that takes a callback and a value. Parseq Requestors 
// are elements of a parseq Sequence. The requestor elements
// are sequentialy called by calling parseq.sequence()

const {
   CQC_HOST,
   CQC_PORT,
   CQC_APPROOT
} = process.env;

const environmentVariables = {
   CQC_HOST,
   CQC_PORT,
   CQC_APPROOT
};
const serverRequestor=makeServer(environmentVariables);
serverRequestor(function (server,reason){
    if (server) {
        console.log(server);
    }   
    if (reason) {
        console.log(reason);
    }
});
