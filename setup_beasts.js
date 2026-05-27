use("newt_suitcase");

db.creatures.drop();

print("⏳ Відкриваємо валізу Ньюта... Генеруємо істот...");

const speciesList = ["Niffler", "Bowtruckle", "Demiguise", "Dragon", "Kelpie", "Thunderbird", "Hippogriff", "Mooncalf", "Occamy"];
const colors = ["Gold", "Silver", "Black", "White", "Green", "Blue", "Red", "Brown"];
const diets = ["Carnivore", "Herbivore", "Omnivore", "Insectivore"];
const locations = ["Britain", "Scottish Highlands", "Amazon", "Sahara", "Hogwarts", "New York", "Alps", "Far East"];
const statuses = ["In Suitcase", "Released", "Under Observation", "Missing"];

const creaturesToInsert = [];

for (let i = 1; i <= 150; i++) {
    const habitats = [];
    const habCount = Math.floor(Math.random() * 3) + 1;

    for (let j = 0; j < habCount; j++) {
        habitats.push(locations[Math.floor(Math.random() * locations.length)]);
    }

    creaturesToInsert.push({
        _id: i,
        name: `Beast-${i}`,
        species: speciesList[Math.floor(Math.random() * speciesList.length)],
        danger_level: Math.floor(Math.random() * 5) + 1,
        habitats: [...new Set(habitats)],
        attributes: {
            color: colors[Math.floor(Math.random() * colors.length)],
            diet: diets[Math.floor(Math.random() * diets.length)],
            magic_power_level: Math.floor(Math.random() * 100) + 1
        },
        status: statuses[Math.floor(Math.random() * statuses.length)],
        sightings: Math.floor(Math.random() * 50)
    });
}

creaturesToInsert.push(
    {
        _id: 996,
        name: "Teddy",
        species: "Niffler",
        danger_level: 1,
        habitats: ["Britain", "Banks"],
        attributes: { color: "Black", diet: "Omnivore", magic_power_level: 15 },
        status: "In Suitcase",
        sightings: 100
    },
    {
        _id: 997,
        name: "Pickett",
        species: "Bowtruckle",
        danger_level: 1,
        habitats: ["Forests"],
        attributes: { color: "Green", diet: "Insectivore", magic_power_level: 10 },
        status: "In Suitcase",
        sightings: 42
    },
    {
        _id: 998,
        name: "Norbert",
        species: "Dragon",
        danger_level: 5,
        habitats: ["Hogwarts", "Romania"],
        attributes: { color: "Green", diet: "Carnivore", magic_power_level: 95 },
        status: "Released",
        sightings: 5
    },
    {
        _id: 999,
        name: "Buckbeak",
        species: "Hippogriff",
        danger_level: 3,
        habitats: ["Hogwarts", "Forests"],
        attributes: { color: "Gray", diet: "Carnivore", magic_power_level: 60 },
        status: "Released",
        sightings: 25
    }
);

db.creatures.insertMany(creaturesToInsert);

print(`✅ Успіх! Додано ${db.creatures.countDocuments({})} фантастичних звірів у колекцію 'creatures'.`);
