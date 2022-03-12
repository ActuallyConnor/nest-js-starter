/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.export = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  coverageReporters: [
    "lcov",
    "text",
    "json-summary"
  ]
};
