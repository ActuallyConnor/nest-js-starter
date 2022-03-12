// no inspection HttpUrlsUsage
export const testUri = (postFix: string): string => `${process.env.TEST_ENDPOINT ?? 'http://node:3000'}/${postFix}`
