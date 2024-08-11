from flask import Flask, jsonify

app = Flask(__name__)

# Dummy data
products = products = [
    {
        'name': 'Apples',
        'image': 'assets/apple.png',
        'stock': 10,
        'price': 2.99,
        'category': 'Fruits',
        'stocks': [
            {'storeName': 'Walmart', 'stock': 10},
            {'storeName': 'Target', 'stock': 5},
            {'storeName': 'Costco', 'stock': 8}
        ]
    },
    {
        'name': 'Bananas',
        'image': 'assets/banana.png',
        'stock': 15,
        'price': 1.29,
        'category': 'Fruits',
        'stocks': [
            {'storeName': 'Walmart', 'stock': 5},
            {'storeName': 'Target', 'stock': 7},
            {'storeName': 'Costco', 'stock': 3}
        ]
    },
    {
        'name': 'Carrots',
        'image': 'assets/carrot.jpg',
        'stock': 20,
        'price': 0.99,
        'category': 'Vegetables',
        'stocks': [
            {'storeName': 'Walmart', 'stock': 12},
            {'storeName': 'Target', 'stock': 6},
            {'storeName': 'Costco', 'stock': 2}
        ]
    },
    {
        'name': 'Milk',
        'image': 'assets/milk.jpg',
        'stock': 5,
        'price': 3.49,
        'category': 'Dairy',
        'stocks': [
            {'storeName': 'Walmart', 'stock': 2},
            {'storeName': 'Target', 'stock': 2},
            {'storeName': 'Costco', 'stock': 1}
        ]
    }
]

@app.route('/api/products', methods=['GET'])
def get_products():
    return jsonify(products)

if __name__ == '__main__':
    app.run(debug=True)
