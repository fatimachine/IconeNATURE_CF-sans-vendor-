<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Orders;
use App\Entity\Product;
use App\Form\OrdersType;
use App\Form\ContactType;
use App\Form\EditProfileType;
use Symfony\Component\Mime\Email;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class WebpageController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index(ProductRepository $tableProducts): Response
    {
        $products = $tableProducts->findBy(array(), array('id'=>'desc'),6);
        $promotion = $tableProducts->findBy(array('discount'=>array('5%', '10%','15%','20%','25%', '30%')), array('discount'=>'desc'), 6);
        return $this->render('webpage/index.html.twig',[
                    'products' => $products,
                    'discount' => $promotion,
                ]);
    }


    /**
     * @Route("/show{id}", name="show")
     */
    public function show(Product $product): Response
    {
        return $this->render('webpage/show.html.twig', [
            'product' => $product,
        ]);
    }


    /**
     * @Route("/homme", name="homme")
     */
    public function homme(ProductRepository $tableProducts): Response
    {
        $products = $tableProducts->findBy(array('gender' =>'Homme', 'category'=>[1 ,2]), array('id'=>'desc'));
        return $this->render('webpage/homme.html.twig',[
            'products' => $products,
        ]);
    }


    /**
     * @Route("/femme", name="femme")
     */
    public function femme(ProductRepository $tableProducts): Response
    {
        $products = $tableProducts->findBy(array('gender' =>'Femme', 'category'=>[1 ,2 ,3]), array('id'=>'desc'));
        return $this->render('webpage/femme.html.twig',[
            'products' => $products,
        ]);
    }



    /**
     * @Route("/sac", name="sac")
     */
    public function sac(ProductRepository $tableProducts): Response
    {
        $products = $tableProducts->findBy(array('category' =>'4'), array('id'=>'desc'));
        return $this->render('webpage/sac.html.twig',[
            'products' => $products,
        ]);
    }


    /**
     * @Route("/profile", name="profile")
     */
    public function profile(SessionInterface $session, ProductRepository $productsRepository): Response
    {
        $panier = $session->get('cart', []);

        $panierWithData = [];

        foreach ($panier as $id => $quantity) {
            $panierWithData [] = [
                'product' => $productsRepository->find($id),
                'quantity' => $quantity
            ];  
        }
        return $this->render('webpage/profile.html.twig', [
            'items' => $panierWithData
        ]);
    }


      /**
     * @Route("/editProfile", name="editProfile")
     */
    public function editProfile(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(EditProfileType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em->getRepository(User::class);
            $em->persist($user);
            $em->flush();

            $this->addFlash('message', 'Profil mis à jour');
            return $this->redirectToRoute('profile');
        }


        return $this->render('webpage/editProfile.html.twig', [
            'form' => $form->createView(),
        ]);
    }



     /**
     * @Route("/order{id}", name="order")
     */
    public function order(Product $product, Request $request, EntityManagerInterface $em): Response
    {
        $newOrder = new Orders();
        $form = $this->createForm(OrdersType::class, $newOrder);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $em->getRepository(Orders::class);
            $em->persist($newOrder);
            $em->flush();

            $this->addFlash('message', 'Votre commend est bien passé');
            return $this->redirectToRoute('profile');
        }
        return $this->render('webpage/order.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }


     /**
     * @Route("/mention", name="mention")
     */
    public function mention(): Response
    {
        return $this->render('webpage/mention.html.twig');
    }


       
    /**
     * @Route("/contact", name="contact")
     */
    public function contact(Request $request, MailerInterface $mailer): Response
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);


        if($form->isSubmitted() && $form->isValid()) {

            $contactFormData = $form->getData();
            
            $message = (new Email())
                ->from($contactFormData['email'])
                ->to('iconenature@gmail.com')
                ->subject('vous avez reçu un email')
                ->text('Sender : '.$contactFormData['email'].\PHP_EOL.
                    $contactFormData['message'],
                    'text/plain');
            $mailer->send($message);

            $this->addFlash('success', 'Vore message a été envoyé');

            return $this->redirectToRoute('contact');
        }

        return $this->render('webpage/contact.html.twig',[
            'form' => $form->createView()
        ]);
    }

       /**
     * @Route("/apropos", name="apropos")
     */
    public function apropos(): Response
    {
        return $this->render('webpage/apropos.html.twig');
    }

    // /**
    //  * @Route("/order{id}", name="order")
    //  */
    // public function order(Product $product, Request $request, EntityManagerInterface $em): Response
    // {
    //     if($request->request->count() > 0){
    //         $newOrder = new Orders();
    //         $newOrder->setProductName($request->request->get('ProductName'))
    //         ->setProductRefNo($request->request->get('ProductRefNo'))
    //         ->setPrice($request->request->get('price'))
    //         ->setSize($request->request->get('size'))
    //         ->setColor($request->request->get('color'))
    //         ->setQuantity($request->request->get('quantity'))
    //         ->setDeliveryMethod($request->request->get('deliveryMethod'))
    //         ->setFirstName($request->request->get('firstName'))
    //         ->setLastName($request->request->get('lastName'))
    //         ->setEmail($request->request->get('email'))
    //         ->setPhoneNo($request->request->get('phoneNo'))
    //         ->setAddress($request->request->get('address'))
    //         ->setPostCode($request->request->get('postCode'))
    //         ->setCity($request->request->get('city'));
    //         $em->persist($newOrder); // on prépare l'insertion
    //         $em->flush(); // on insère
    //         }   
    //     return $this->render('webpage/order.html.twig', [
    //         'product' => $product,
    //     ]);
    // }


    //  /**
    //  * @Route("/webpage", name="accueil")
    //  */
    // public function index(): Response
    // {
    //     return $this->render('webpage/index.html.twig', [
    //         'controller_name' => 'WebpageController',
    //     ]);
    // }
}
