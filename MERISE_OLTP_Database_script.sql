USE [BD_EL_MASSAR]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06/06/2022 8:46:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Code_client] [int] NOT NULL,
	[Nom] [varchar](55) NOT NULL,
	[Prenom] [varchar](55) NOT NULL,
	[Adresse] [varchar](100) NOT NULL,
	[Num_téléphone] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commandes]    Script Date: 06/06/2022 8:46:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commandes](
	[Code_commande] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Montant] [int] NOT NULL,
	[code_clients] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code_commande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contenir]    Script Date: 06/06/2022 8:46:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenir](
	[Code_commandes] [int] NOT NULL,
	[Ref] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 06/06/2022 8:46:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[Reference] [int] NOT NULL,
	[Libellé] [varchar](55) NOT NULL,
	[Catégorie] [varchar](55) NOT NULL,
	[Prix] [int] NOT NULL,
	[Quantité_stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Reference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD FOREIGN KEY([code_clients])
REFERENCES [dbo].[Clients] ([Code_client])
GO
ALTER TABLE [dbo].[Contenir]  WITH CHECK ADD FOREIGN KEY([Code_commandes])
REFERENCES [dbo].[Commandes] ([Code_commande])
GO
ALTER TABLE [dbo].[Contenir]  WITH CHECK ADD FOREIGN KEY([Ref])
REFERENCES [dbo].[Produits] ([Reference])
GO