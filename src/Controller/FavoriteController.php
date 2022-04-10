<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class FavoriteController extends AbstractController
{
    /**
     * @Route("/favorite", name="favorite")
     */
    public function index(SessionInterface $session, ProductRepository $productsRepository): Response
    {
        $favorite = $session->get('favorite', []);

        $favoriteWithData = [];

        foreach ($favorite as $id => $quantity) {
            $favoriteWithData [] = [
                'product' => $productsRepository->find($id),
                'quantity' => $quantity
            ];  
        }

        $total = 0;
        foreach ($favoriteWithData as $item) {
            $totalItem = $item['product']->getPrice() * $item['quantity'];
            $total += $totalItem;
        }
        
        // dd($favoriteWithData);
        return $this->render('favorite/index.html.twig', [
            'items' => $favoriteWithData,
            'total' => $total
        ]);

    }


    /**
     * @Route("/favorite/add/{id}", name="favorite_add")
     */
    public function add($id, SessionInterface $session){

        $favorite = $session->get('favorite', []);
        
        if (!empty($favorite[$id])) {
            $favorite[$id]++;
        }else{
            $favorite[$id]=1; 
        }

        $session->set('favorite', $favorite);

        // dd($session->get('favorite'));
        return $this->redirectToRoute('favorite');
    }

    /**
     * @Route("/favorite/remove/{id}", name="favorite_remove")
     */
    public function remove($id, SessionInterface $session)
    {
        $favorite = $session->get('favorite', []);

        if (!empty($favorite[$id])) {
           unset($favorite[$id]);
        }

        $session->set('favorite', $favorite);

        return $this->redirectToRoute('favorite');
    }
}
