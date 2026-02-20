const githubThemeApiUrl =
    'https://api.github.com/repos/Gogh-Co/Gogh/contents/data/themes-min.json?ref=master';

function normalizeThemes(remoteThemes: unknown) {
    if (Array.isArray(remoteThemes)) {
        return remoteThemes;
    }

    if (
        remoteThemes &&
        typeof remoteThemes === 'object' &&
        'data' in remoteThemes &&
        Array.isArray((remoteThemes as { data?: unknown }).data)
    ) {
        return (remoteThemes as { data: unknown[] }).data;
    }

    return [];
}

export default defineEventHandler(async () => {
    try {
        const response = await fetch(githubThemeApiUrl, {
            signal: AbortSignal.timeout(12000),
            headers: {
                Accept: 'application/vnd.github.raw+json',
                'User-Agent': 'gogh-website',
                'X-GitHub-Api-Version': '2022-11-28',
            },
        });

        if (!response.ok) {
            throw createError({
                statusCode: 502,
                statusMessage: `GitHub API request failed (${response.status})`,
            });
        }

        const remoteThemes = (await response.json()) as unknown;
        const normalized = normalizeThemes(remoteThemes);

        if (normalized.length > 0) {
            return normalized;
        }
    } catch (error) {
        if (error && typeof error === 'object' && 'statusCode' in error) {
            throw error;
        }
    }

    throw createError({
        statusCode: 502,
        statusMessage: 'Could not fetch themes from GitHub API',
    });
});
