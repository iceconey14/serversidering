<?php
$websites = [
    ['url' => 'https://example1.com', 'exampleslug1' => 'example 1'],
    ['url' => 'https://example2.com', 'exampleslug2' => 'example 2'],
    ['url' => 'https://example3.com', 'exampleslug3' => 'example 3']
];
function getCurrentIndex($slug, $websites) {
    foreach ($websites as $index => $website) {
        if ($website['url'] == $slug) {
            return $index;
        }
    }
    return 0;
}
function getNextUrl($slug, $websites) {
    $currentIndex = getCurrentIndex($slug, $websites);
    $nextIndex = ($currentIndex + 1) % count($websites);
    return $websites[$nextIndex]['url'];
}
function getPrevUrl($slug, $websites) {
    $currentIndex = getCurrentIndex($slug, $websites);
    $prevIndex = ($currentIndex - 1 + count($websites)) % count($websites);
    return $websites[$prevIndex]['url'];
}
function getRandomUrl($websites) {
    $randomIndex = array_rand($websites);
    return $websites[$randomIndex]['url'];
}
$action = $_GET['to'] ?? '';
$slug = $_GET['slug'] ?? '';
if ($action == 'next') {
    header("Location: " . getNextUrl($slug, $websites));
    exit();
} elseif ($action == 'prev') {
    header("Location: " . getPrevUrl($slug, $websites));
    exit();
} elseif ($action == 'random') {
    header("Location: " . getRandomUrl($websites));
    exit();
} else {
    echo "(&#x28;&#x256F;&#xB0;&#x25A1;&#xB0;&#x29;&#x256F;&#xFE35;&#x2035;&#x2501;&#x2032;)";
}
?>
