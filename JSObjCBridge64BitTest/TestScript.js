log("starting with new DHPoint created in javascript\n");
var p = DHPoint.point();
log("point: " + p + " x: " + p.x + " y: " + p.y);
log("should say: x:42 y:24");

log("\nnow setting in javascript p.x to 84, and p.y to 48\n");
p.x = 84;
p.y = 48;
log("point: " + p + " x: " + p.x + " y: " + p.y);
log("should say: x:84 y:48");
