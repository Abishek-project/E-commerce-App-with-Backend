'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "24bc1e3ca33b5f646fc85e46b9cded68",
"index.html": "d77bc1e4fed314e79d145be773beeb3e",
"/": "d77bc1e4fed314e79d145be773beeb3e",
"main.dart.js": "00929128ee37468727b8b023777f7410",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "704ce5fc4e06c2d9d7b6fe1016fe0e20",
"assets/AssetManifest.json": "b836f9ebd5a69098b6de2822e6af6406",
"assets/NOTICES": "916b640f290ed0ddfbda92efc893a986",
"assets/FontManifest.json": "7bca256ac905fba0c97eb0f514183f3a",
"assets/AssetManifest.bin.json": "4f1be99747d39c984fff45c2c69812df",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "38d76e6c2ea896123584206f8291f889",
"assets/fonts/MaterialIcons-Regular.otf": "29659757128eadb2f02cf60591d08575",
"assets/assets/Search.svg": "1454f592f547a2dee829b218d3c7203b",
"assets/assets/splashScreen.jpg": "cf47f3ad12ceb847e232539f44af62d3",
"assets/assets/User%2520Icon.svg": "3944ad12a2e9014c192fc5795e69a589",
"assets/assets/home-20-svgrepo-com.svg": "1cfae7270544d53dad801c94f5261bb9",
"assets/assets/bag-svgrepo-com.svg": "912884e388f8a8fedb85f4fa9fd41110",
"assets/assets/clothes-hanger.png": "1fb725fa39e4ad1a5ae03a3401738b1a",
"assets/assets/Shop%2520Icon.svg": "71cf1a5022470cbbd1e76a923d1d968f",
"assets/assets/Cart%2520Icon.svg": "b58f308b0312e4358a04eeadc02575d5",
"assets/assets/delete-svgrepo-com.svg": "15ab3eae48f0f63296a985da9a1bdcd7",
"assets/assets/filter-edit-svgrepo-com.svg": "ee254f1c626b400c84802b49933127b8",
"assets/assets/smartphone.png": "a2f1a1c97175a614e8742bde6429b914",
"assets/assets/home.png": "2ffc96a77c23c00a95ed2aa44b6dbd38",
"assets/assets/Bell.svg": "536eb6601a35ddab0f7b6bdd6c3ff145",
"assets/assets/menu-alt-1-svgrepo-com.svg": "54acde9f316c9a337f6be624bc836002",
"assets/assets/graph-increase-svgrepo-com%2520(1).svg": "5bda8300876a53aa007ee0daffcebba4",
"assets/assets/sofa.png": "5a657a66da1506bc679b20a75de46d69",
"assets/assets/logout-svgrepo-com.svg": "4b16160d9d6fb9c95f10ef1aca87cfe5",
"assets/assets/notification-bing-svgrepo-com.svg": "4fca3523c1a6801c9216305c3bc6a4e2",
"assets/assets/left-arrow-backup-2-svgrepo-com.svg": "073715e5a4bdb00c237cca1afd13ac7d",
"assets/assets/ps4_console_blue_1.png": "0085bd0d4680ea7e99d92fbd1a2d67df",
"assets/assets/Notification.svg": "171c851f91eadc90b34ac3bd5e50424f",
"assets/assets/washing-machine.png": "bbe4a37abce47e91ee4c2ab1f211966a",
"assets/assets/facebook.svg": "0eefa3e5635dae17a004aa1231a4bb15",
"assets/assets/google.svg": "614bc7916ea808fd52e7b58b221ca1a5",
"assets/assets/backArrow.svg": "2c28864db85726eaa827004fae5eaa80",
"assets/assets/fWzKFjkXmo.json": "82f191856560da636d68664a06c8694e",
"assets/assets/trash.svg": "f8f175f0734c4e3c6ac519384111bb57",
"assets/assets/heart-svgrepo-com.svg": "06a0cc946adc3a9de8f8ff04392637eb",
"assets/assets/wishlist-svgrepo-com.svg": "13b3444b8921c6f0d1c8f2df5f2e15cb",
"assets/assets/profile.jpeg": "2519cf1cb154ed0ce88010ce3c025756",
"assets/assets/Image%2520Banner%25203.png": "ac22df8189dc403ff2e113489fb114b4",
"assets/assets/Image%2520Banner%25202.png": "1d233e6648a139a8b30d63489e852fc8",
"assets/assets/products.png": "2cc051fa94da199419b6a85acdd0022c",
"assets/assets/location-pin-svgrepo-com.svg": "a95eee20e21a8c87373535031c8aa39a",
"assets/assets/pic.png": "6011f2943b1b058967dc174106ebfda5",
"assets/assets/fonts/sfprosemibold.ttf": "1a131c948d598ecec700d37d168a15b5",
"assets/assets/fonts/sfproregular.ttf": "85bd46c1cff02c1d8360cc714b8298fa",
"assets/assets/fonts/sfprodisplaybold.ttf": "42d79eba974955740a95cc0fb71ca247",
"assets/assets/fonts/sfprobold.ttf": "d6079ef01292c4bc84dce33988641530",
"assets/assets/Admin.png": "52581786a7dc127fe5e83bf7d0f9e43b",
"assets/assets/Heart%2520Icon_2.svg": "fd7dce0eb7741375843bcda4c7f4e52d",
"assets/assets/menu.svg": "841aa80bfd49f7ca9a1283e11b4d3bd5",
"assets/assets/apple.svg": "7afcb1b7538f261ed6199d122705dd52",
"assets/assets/inbox-in-svgrepo-com.svg": "4767f577652f054e1f5646faa61f2d4a",
"assets/assets/cart-large-2-svgrepo-com%2520(1).svg": "bb75719946738e7582d2a27f9611bfb4",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
