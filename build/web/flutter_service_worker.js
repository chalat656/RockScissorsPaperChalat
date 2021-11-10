'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c1376ed390b69cb1185b32cb565b8255",
"assets/assets/images/557726.png": "93b36b69fc0a7488f6d5b40bcc87a502",
"assets/assets/images/A1.jpg": "55ed9ba912ac6504df6c84bdb1bab3fe",
"assets/assets/images/BackG1.jpg": "4980d119f2550c49e30a95065d9ac5e7",
"assets/assets/images/BackG2.jpg": "23e28689a13c1b7f77d2ac47a4ba2483",
"assets/assets/images/BGHardcore.jpg": "d69fcf7ed7eac38759f74cad83171673",
"assets/assets/images/BGNormal.jpg": "83673a4e4425efcae541fac286869f2e",
"assets/assets/images/Brid.png": "2143308a8052695ae9e0abcf8192b7e8",
"assets/assets/images/Daco.png": "df039e1f245a4b9b71bd58eb3ab82417",
"assets/assets/images/Dog.png": "6b741d1c0fc9cff648bc27a71f7643c0",
"assets/assets/images/Easybot.png": "543c97b9371449d5f3cf86f3fee14071",
"assets/assets/images/Ezbot.png": "cdc0e34819cd4e47db7c9155bc980540",
"assets/assets/images/EZZBot.png": "b98d768cc202123aa6a61b79330c756b",
"assets/assets/images/GameOver.png": "83130bd1be152cb56db474ad8248432d",
"assets/assets/images/Go-back-icon.png": "e531e181edb6b6646fbfc633e93b3883",
"assets/assets/images/HardcodeMode.png": "af62b614b04cbdb665b4fc6845806721",
"assets/assets/images/HardcoreBot.jpeg": "a3ccba2b13bbc4c7d67068d40ef14d28",
"assets/assets/images/NBot.png": "a16f3fc24aab50c82999886c7d807452",
"assets/assets/images/NormalBot.png": "81119f55d83d7af8e7cd4f4e8ba90557",
"assets/assets/images/NormalMode.png": "9308d27ca436c307d75106621c7194a0",
"assets/assets/images/Paper.jpg": "678e1c4f47a71c47abca8e1e04464d7e",
"assets/assets/images/park.jpg": "f9fb76a46b98bba7a5d627016445f4fa",
"assets/assets/images/player.png": "e50ec821df4537312b27451d93dc417c",
"assets/assets/images/pngegg.png": "2d4eeb9bde1ac0754883e62f52661ab7",
"assets/assets/images/Rock.jpg": "34ee9c0307dac6bed99e1bd9caaaa05b",
"assets/assets/images/Scissors.jpg": "231ae6fb9aab416bfe6b464de9eabbca",
"assets/assets/images/Try.png": "a0a041476de8fa00f4d880b0d0da5e55",
"assets/assets/images/VS.png": "6d9be82cde3a2b00eb0a78a82b9f58e7",
"assets/assets/images/Win.png": "2e486992a12e3866cc1f223f0301dd07",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "b190d1a83962890f013f8563eba1595a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "360ef4a63625b300ff81d28fb95e6476",
"/": "360ef4a63625b300ff81d28fb95e6476",
"main.dart.js": "48ec725226bbfdf6402c11fb068442df",
"manifest.json": "3ffd0eb1c219c58ad473c11346ee7ef8",
"version.json": "0a236b2141bf565140bfa2d976b163be"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
