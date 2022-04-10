<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="cart")
     */
    public function index(SessionInterface $session, ProductRepository $productsRepository): Response
    {
        $panier = $session->get('cart', []);

        $panierWithData = [];

        foreach ($panier as $id => $quantity) {
            $panierWithData [] = [
                'product' => $productsRepository->find($id),
                'quantity' => $quantity
            ];  
        }

        $total = 0;
        foreach ($panierWithData as $item) {
            $totalItem = $item['product']->getPrice() * $item['quantity'];
            $total += $totalItem;
        }
        
        // dd($panierWithData);
        return $this->render('cart/index.html.twig', [
            'items' => $panierWithData,
            'total' => $total
        ]);

    }


    /**
     * @Route("/cart/add/{id}", name="cart_add")
     */
    public function add($id, SessionInterface $session){

        $panier = $session->get('cart', []);
        
        if (!empty($panier[$id])) {
            $panier[$id]++;
        }else{
            $panier[$id]=1; 
        }

        $session->set('cart', $panier);

        // dd($session->get('cart'));
        return $this->redirectToRoute('cart');
    }

    /**
     * @Route("/cart/remove/{id}", name="cart_remove")
     */
    public function remove($id, SessionInterface $session)
    {
        $panier = $session->get('cart', []);

        if (!empty($panier[$id])) {
           unset($panier[$id]);
        }

        $session->set('cart', $panier);

        return $this->redirectToRoute('cart');
    }
}
