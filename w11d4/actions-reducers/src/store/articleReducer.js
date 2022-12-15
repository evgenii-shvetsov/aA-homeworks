import articles from '../data/data.json';

const LOAD_ARTICLES = 'article/loadArticles';

export const loadArticles = ()=>{
    return {
        type: LOAD_ARTICLES,
        articles
    }
}