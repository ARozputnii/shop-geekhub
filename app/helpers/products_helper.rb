module ProductsHelper
  def rand_image_to_heroku
    arr = ['https://cfl.com.ua/book/image/9781292115986.jpg',
           'https://cfl.com.ua/book/image/1308.jpg',
           'https://cfl.com.ua/book/image/lc1471521386.jpg',
           'https://cfl.com.ua/book/image/506.jpg',
           'https://cfl.com.ua/book/image/lc1780984421.jpg',
           'https://cfl.com.ua/book/image/fff1.jpg',
           'https://cfl.com.ua/book/image/81mr4wsrhwl.jpg',
           'https://cfl.com.ua/book/image/a1.jpg',
           'https://cfl.com.ua/book/image/1329.jpg',
           'https://cfl.com.ua/book/image/1218.jpg',
           'https://cfl.com.ua/book/image/access.jpg',
           'https://cfl.com.ua/book/image/1311.jpg',
           'https://cfl.com.ua/book/image/1354.jpg',
           'https://cfl.com.ua/book/image/160.jpg']
    arr.sample
  end
end
