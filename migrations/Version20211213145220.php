<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211213145220 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE users ADD agence_id INT NOT NULL');
        $this->addSql('ALTER TABLE users ADD CONSTRAINT FK_1483A5E9D1F6E7C3 FOREIGN KEY (agence_id) REFERENCES agences (id)');
        $this->addSql('CREATE INDEX IDX_1483A5E9D1F6E7C3 ON users (agence_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE users DROP FOREIGN KEY FK_1483A5E9D1F6E7C3');
        $this->addSql('DROP INDEX IDX_1483A5E9D1F6E7C3 ON users');
        $this->addSql('ALTER TABLE users DROP agence_id');
    }
}
