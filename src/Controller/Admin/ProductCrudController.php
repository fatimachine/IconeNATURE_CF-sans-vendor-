<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('name'),
            TextField::new('referenceNo'),
            TextField::new('gender'),
            AssociationField::new('category'),
            // TextEditorField::new('description'),
            TextareaField::new('description')->setMaxLength(15),
            // MoneyField::new('price')->setCurrency('EUR'),
            NumberField::new('price')->setNumDecimals(2),

            ImageField::new('image')
                // ->setBasePath('upload/images')
                ->setUploadDir('public/upload/images')
                ->setUploadedFileNamePattern('../upload/images/'.'[slug]-[contenthash].[extension]')
                ->setSortable(false),

            TextField::new('discount'),
            TextField::new('color'),
            TextField::new('size'),
            BooleanField::new('active'),
            DateTimeField::new('createdAt')->hideOnForm(),
        ];
    }

    public function persistEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        if (! $entityInstance instanceof Product) return ;
            $entityInstance->setCreatedAt(new \DateTimeImmutable);
            // dd($entityInstance);
            parent::persistEntity($entityManager, $entityInstance);
    }
    
}
