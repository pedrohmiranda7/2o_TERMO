const fs = require("fs");

const maquinas = [
    { id: 1, nome: "Torno CNC", horasUso: 1200 },
    { id: 2, nome: "Fresadora", horasUso: 800 },
    { id: 3, nome: "Prensa Hidraulica", horasUso: 1500 },
    { id: 4, nome: "Corte a Laser", horasUso: 500 }
];

const manutencao = maquinas.filter(function(maquina) {
    return maquina.horasUso > 1000;
});

console.log("Máquinas que precisam de manutenção:");
console.log(manutencao);

fs.writeFileSync(
    "manutencao_urgente.json",
    JSON.stringify(manutencao, null, 2)
);

console.log("Arquivo criado!");