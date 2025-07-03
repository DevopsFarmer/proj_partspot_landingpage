import Head from 'next/head'
import Image from 'next/image'
import { motion } from 'framer-motion'
import Confetti from 'react-confetti'
import { useEffect, useState } from 'react'

function useWindowSize() {
  const [size, setSize] = useState({ width: 0, height: 0 })
  useEffect(() => {
    function handleResize() {
      setSize({ width: window.innerWidth, height: window.innerHeight })
    }
    handleResize()
    window.addEventListener('resize', handleResize)
    return () => window.removeEventListener('resize', handleResize)
  }, [])
  return size
}

export default function Home() {
  const { width, height } = useWindowSize()
  const [showConfetti, setShowConfetti] = useState(false)

  useEffect(() => {
    setShowConfetti(true)
  }, [])

  const taglines = [
    "Jodhpur’s Ultimate Event Booking App – Where Traditions Meet Technology",
    "Get Ready to Party with PartySpot – From Mehandi to Mehfil",
    "Your Event. Our Magic. Coming Soon!"
  ]
  const tagline = taglines[Math.floor(Math.random() * taglines.length)]
  const isMobile = width < 768
  const isTablet = width >= 768 && width < 1024

  return (
    <div style={{
      textAlign: 'center',
      padding: isMobile ? '1rem' : isTablet ? '2rem' : '3rem',
      background: 'black',
      color: 'white',
      minHeight: '100vh',
      position: 'relative'
    }}>
      <Head>
        <title>PartyWalah – Coming Soon!</title>
      </Head>

      {showConfetti && (
        <Confetti
          width={width}
          height={height}
          recycle={false}
          numberOfPieces={isMobile ? 80 : isTablet ? 150 : 250}
          gravity={isMobile ? 0.2 : isTablet ? 0.3 : 0.4}
          wind={isMobile ? 0.01 : 0.02}
        />
      )}

      {/* Rajasthani Animation Overlay */}
      {/* <motion.img
        src="https://cdn.pixabay.com/photo/2019/08/28/14/44/rajasthani-4436347_960_720.png"
        alt="Rajasthani Dancer"
        initial={{ opacity: 0, x: -200 }}
        animate={{ opacity: 0.7, x: 0 }}
        transition={{ duration: 2 }}
        style={{
          position: 'absolute',
          top: '10%',
          left: '5%',
          width: isMobile ? '80px' : isTablet ? '150px' : '200px',
          opacity: 0.8,
          transition: 'transform 0.3s',
        }}
        whileHover={{ scale: 1.1 }}
      /> */}

      {/* <motion.img
        src="https://cdn.pixabay.com/photo/2017/11/21/13/46/rajasthan-2964843_960_720.jpg"
        alt="Jodhpur Fort"
        initial={{ opacity: 0, x: 200 }}
        animate={{ opacity: 0.7, x: 0 }}
        transition={{ duration: 2 }}
        style={{
          position: 'absolute',
          bottom: '10%',
          right: '5%',
          width: isMobile ? '80px' : isTablet ? '150px' : '200px',
          opacity: 0.8,
          borderRadius: '10px',
          transition: 'transform 0.3s',
        }}
        whileHover={{ scale: 1.1 }}
      /> */}

      <motion.div
        initial={{ opacity: 0, scale: 0.5, y: -50 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        transition={{ duration: 1, type: 'spring' }}
      >
        <Image src="/partyspot-logo.png" alt="Party Spot Logo" width={isMobile ? 120 : 200} height={isMobile ? 120 : 200} />
      </motion.div>

      <motion.h1
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.5, duration: 1 }}
        style={{
          fontSize: isMobile ? '2.5rem' : isTablet ? '3rem' : '3.8rem',
          marginTop: '1rem',
          transition: 'color 0.3s',
          fontWeight: '900',
          color: '#FFFFFF', // default text color for dark theme
          textAlign: 'center',
          textShadow: '0 0 10px #ff4d00, 0 0 20px #ff4d00', // subtle glow
        }}
        whileHover={{
          color: '#FFEA00', // bright neon yellow on hover
          textShadow: '0 0 20px #FFEA00, 0 0 40px #FFEA00', // glow effect
          scale: 1.1, // optional pop effect
        }}
      >
        🎉 <span style={{
          background: 'linear-gradient(90deg, #ff4d00, #ff9e00, #ffea00)', 
          WebkitBackgroundClip: 'text', 
          WebkitTextFillColor: 'transparent',
          fontWeight: '900',
          textTransform: 'uppercase',
          letterSpacing: '3px',
          textShadow: 'none',
        }}>PartyWalah</span> by Partyspot 🎉
      </motion.h1>


      <motion.p
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1, duration: 1 }}
        style={{
          fontSize: isMobile ? '1rem' : isTablet ? '1.25rem' : '1.5rem',
          marginTop: '1rem',
          fontStyle: 'italic',
          transition: 'color 0.3s',
        }}
        whileHover={{ color: '#ff9e00' }}
      >
        {tagline}
      </motion.p>

      {/* Mehandi & Haldi Visuals with Hover */}
      {/* <motion.img
        src="https://cdn.pixabay.com/photo/2017/09/02/16/25/mehndi-2702860_960_720.jpg"
        alt="Mehandi"
        initial={{ opacity: 0, scale: 0.5 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ delay: 1.5, duration: 1 }}
        style={{
          width: isMobile ? '80px' : isTablet ? '120px' : '150px',
          marginTop: '2rem',
          borderRadius: '10px',
          transition: 'transform 0.3s',
        }}
        whileHover={{ scale: 1.1 }}
      /> */}

      {/* <motion.img
        src="https://cdn.pixabay.com/photo/2018/01/17/16/42/haldi-3088270_960_720.jpg"
        alt="Haldi Function"
        initial={{ opacity: 0, scale: 0.5 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ delay: 2, duration: 1 }}
        style={{
          width: isMobile ? '80px' : isTablet ? '120px' : '150px',
          marginTop: '1rem',
          borderRadius: '10px',
          transition: 'transform 0.3s',
        }}
        whileHover={{ scale: 1.1 }}
      /> */}

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 2.5, duration: 1 }}
        style={{ marginTop: '2rem' }}
      >
        <a
          href="https://www.instagram.com/party_spot_jd/"
          style={{
            padding: isMobile ? '0.5rem 1rem' : '1rem 2rem',
            background: '#ff9e00',
            color: 'black',
            borderRadius: '2rem',
            textDecoration: 'none',
            fontWeight: 'bold',
            boxShadow: '0 4px 15px rgba(0,0,0,0.2)',
            transition: 'transform 0.3s, background 0.3s',
          }}
          onMouseEnter={(e) => {
            e.currentTarget.style.background = '#ffa500'
            e.currentTarget.style.transform = 'scale(1.1)'
          }}
          onMouseLeave={(e) => {
            e.currentTarget.style.background = '#ff9e00'
            e.currentTarget.style.transform = 'scale(1)'
          }}
        >
          Follow Us @ party_spot_jd 💜
        </a>
      </motion.div>
            <footer
  style={{
    marginTop: '4rem',
    paddingTop: '2rem',
    borderTop: '1px solid #444',
    fontSize: '0.9rem',
    color: '#aaa',
  }}
>
  <p>
    © {new Date().getFullYear()} Partyspot Technologies Pvt. Ltd. |{' '}
    <a
      href="/privacy"
      style={{ color: '#ff9e00', textDecoration: 'underline' }}
    >
      Privacy Policy
    </a>{' '}
    |{' '}
    <a
      href="/terms"
      style={{ color: '#ff9e00', textDecoration: 'underline' }}
    >
      Terms & Conditions
    </a>
  </p>
</footer>
    </div>
  )
}
